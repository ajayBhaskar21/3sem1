document.getElementById("calculate-button").addEventListener("click", calculateMetrics);

function calculateMetrics() {
    const inputMatrix = [];
    for (let i = 0; i < 3; i++) {
        const row = [];
        for (let j = 0; j < 3; j++) {
            const inputField = document.getElementsByName(`matrix${i}${j}`)[0];
            const inputValue = parseInt(inputField.value);
            row.push(inputValue);
        }
        inputMatrix.push(row);
    }

    const classes = ["Apple", "Orange", "Mango"];

    for (let i = 0; i < inputMatrix.length; i++) {
        let TP = 0, TN = 0, FP = 0, FN = 0;

        // True Positive
        TP = inputMatrix[i][i];

        // True Negative
        for (let j = 0; j < inputMatrix.length; j++)
            for (let k = 0; k < inputMatrix.length; k++)
                if (j !== i && k !== i)
                    TN += inputMatrix[j][k];

        // False Positive
        for (let j = 0; j < inputMatrix.length; j++)
            if (j !== i)
                FP += inputMatrix[i][j];

        // False Negative
        for (let k = 0; k < inputMatrix.length; k++)
            if (k !== i)
                FN += inputMatrix[k][i];

        const precision = TP / (TP + FP);
        const recall = TP / (TP + FN);
        const accuracy = (TP + TN) / (TP + TN + FP + FN);
        const f1Score = (2 * precision * recall) / (precision + recall);

        // Display metrics in HTML
        document.getElementById(`precision${classes[i]}`).textContent = precision.toFixed(4);
        document.getElementById(`recall${classes[i]}`).textContent = recall.toFixed(4);
        document.getElementById(`accuracy${classes[i]}`).textContent = accuracy.toFixed(4);
        document.getElementById(`f1${classes[i]}`).textContent = f1Score.toFixed(4);
    }
}
