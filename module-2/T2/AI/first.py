
class InfantLearning:
    def __init__(self):
        self.vocab = set()

    def listen_and_learn_supervised(self):
        # Taking supervised input from the user
        speech_input = input("Enter supervised speech input: ")
        print(f"Received supervised speech input: {speech_input}")
        self.vocab.add(speech_input)

    def listen_and_learn_unsupervised(self):
        # Simulating unsupervised learning by generating babble output
        babble_output = self.babble()
        print(f"Received unsupervised babble input: {babble_output}")
        self.vocab.add(babble_output)

    def babble(self):
        # Simulating the process of babbling
        babble_output = random.choice(["ba", "ma", "da"])
        print(f"Babble Output: {babble_output}")
        return babble_output

    def social_interaction(self, feedback):
        # Simulating positive reinforcement
        if feedback == "smile":
            print("Infant is happy and encouraged!")
        elif feedback == "correction":
            print("Infant receives corrective feedback.")

# Example Usage with Supervised and Unsupervised Learning
infant = InfantLearning()

# Supervised learning - caregiver provides input
infant.listen_and_learn_supervised()

# Unsupervised learning - babbling
infant.listen_and_learn_unsupervised()

# Reinforcement learning - positive social interaction
infant.social_interaction("smile")

# Reinforcement learning - corrective feedback
infant.social_interaction("correction")