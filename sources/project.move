module MedicalApp::FeedbackReview {
    use std::string::{Self, String};
    use aptos_framework::signer;
    use aptos_framework::timestamp;

    /// Error codes
    const ERR_REVIEW_NOT_FOUND: u64 = 1;
    const ERR_NOT_AUTHORIZED: u64 = 2;

    /// Struct representing a medical review
    struct Review has store, key {
        doctor_address: address,    // Doctor being reviewed
        content: String,            // Review content
        rating: u8,                 // Rating (1-5)
        timestamp: u64,             // When the review was created
        response: String            // Doctor's response (empty if none)
    }

    /// Counter for tracking reviews per patient
    struct ReviewCounter has key {
        total_reviews: u64          // Number of reviews submitted by this patient
    }

    /// Function for patients to submit a medical review
    public entry fun submit_review(
        patient: &signer,
        doctor_address: address,
        content: String,
        rating: u8
    ) acquires ReviewCounter {
        let patient_addr = signer::address_of(patient);
        
        // Initialize counter if it doesn't exist
        if (!exists<ReviewCounter>(patient_addr)) {
            move_to(patient, ReviewCounter { total_reviews: 0 });
        };
        
        // Get and increment the review count
        let counter = borrow_global_mut<ReviewCounter>(patient_addr);
        counter.total_reviews = counter.total_reviews + 1;
        
        // Cap the rating at 5
        let capped_rating = if (rating > 5) 5 else rating;
        
        // Create and store the review
        let review = Review {
            doctor_address,
            content,
            rating: capped_rating,
            timestamp: timestamp::now_seconds(),
            response: string::utf8(b"")  // Empty response initially
        };
        
        move_to(patient, review);
    }

    /// Function for doctors to respond to a review
    public entry fun respond_to_review(
        doctor: &signer,
        patient_address: address,
        response: String
    ) acquires Review {
        let doctor_addr = signer::address_of(doctor);
        
        // Verify the review exists and belongs to this doctor
        assert!(exists<Review>(patient_address), ERR_REVIEW_NOT_FOUND);
        let review = borrow_global_mut<Review>(patient_address);
        assert!(review.doctor_address == doctor_addr, ERR_NOT_AUTHORIZED);
        
        // Add the response
        review.response = response;
    }
}