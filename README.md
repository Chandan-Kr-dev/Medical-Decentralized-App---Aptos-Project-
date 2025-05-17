# Medical Feedback Review dApp

## Project Title
Medical Feedback and Review System on Aptos Blockchain

## Project Description
This project is a decentralized application (dApp) built on the Aptos blockchain that allows patients to submit reviews and feedback for healthcare providers. The system provides a transparent, immutable, and secure platform for sharing medical experiences while enabling doctors to respond to feedback.

The core smart contract enables two primary functions:
1. Patients can submit reviews with ratings (1-5) for specific doctors
2. Doctors can respond to reviews written about them

All reviews and responses are stored on-chain, ensuring transparency and preventing tampering. The system maintains a record of each patient's review history and ensures that only the doctor being reviewed can respond to a specific review.

## Project Vision
Our vision is to revolutionize healthcare feedback systems by:

- **Enhancing Trust**: Creating a transparent and immutable record of patient experiences
- **Improving Accountability**: Giving healthcare providers a platform to directly respond to feedback
- **Empowering Patients**: Allowing patients to make informed decisions based on authentic, verified reviews
- **Driving Quality**: Using distributed feedback to identify areas of improvement in healthcare delivery

We believe blockchain technology, particularly the Aptos ecosystem, provides the ideal foundation for medical feedback due to its:
- Strong security guarantees
- Immutable record-keeping
- Ability to verify the authenticity of reviewers and healthcare providers
- Resistance to censorship or unauthorized modification

In the future, this foundation could expand to include:
- Integration with medical credential verification systems
- Anonymous but verifiable patient reviews
- Community governance of review standards and guidelines
- Analysis tools to identify trends in healthcare quality

By building this system, we aim to contribute to a more transparent, accountable, and patient-centered healthcare ecosystem.

## Technical Implementation
The project is implemented as a Move smart contract on the Aptos blockchain. Key components include:

- `Review` struct: Stores review content, rating, timestamp, and response
- `ReviewCounter`: Tracks the number of reviews per patient
- `submit_review` function: Allows patients to submit reviews 
- `respond_to_review` function: Allows doctors to respond to reviews

## Getting Started
To use this dApp:

1. Clone the repository
2. Install the Aptos CLI
3. Compile the Move contract
4. Deploy to the Aptos network
5. Interact with the contract using the provided function calls

Contract Adress : MedicalApp="0x2ab2b511c48f210fa47900277b5d924672b60b59927de585d4f5309183c6ee44"

