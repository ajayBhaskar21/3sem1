class mat {
    public static void main(String[] args) {
        int[][] matrix = {
            {8, 6, 7},
            {2, 6, 2},
            {4, 2, 3}
        };
        String[] classes = {"Apple", "Orange", "Mango"};
        for (int i = 0; i < matrix.length; i++) {
            int TP = 0, TN = 0, FP = 0, FN = 0;
            System.out.println("For Class : " + classes[i]);
            // True Positive
            TP = matrix[i][i];
            // True Negative
            for (int j = 0; j < matrix.length; j ++)
                for (int k = 0; k < matrix.length; k ++)
                    if (j != i && k != i)
                        TN += matrix[j][k];
            // False Positive
            for (int j = 0; j < matrix.length; j++)
                if (j != i) 
                    FP += matrix[i][j];
            // False Negative
            for (int k = 0; k < matrix.length; k++) 
                if (k != i) 
                    FN += matrix[k][i];
            double precision = TP / (double) (TP + FP);
            double recall = TP / (double) (TP + FN);
            System.out.println("TP, TN, FP, FN : " + TP + " " + TN + " " + FP + " " + FN);
            System.out.println("Accuracy = " + (TP + TN) / (double) (TP + TN + FP + FN));
            System.out.println("Precision = " + precision);
            System.out.println("Recall = " + recall);
            System.out.println("F1 score = " + (2 * precision * recall) / (precision + recall));
        }
    }
}