import math
import pandas as pd
def questionA():


    # take input from the csv
    df = pd.read_csv('data.csv')
    
    # read from csv file and convert into list
    dataset = df['distance']
    
    # no of clusters
    k = 2
    # no of centroids
    noOfCentroid = 2
    c1 = [15, 32]
    c2 = [12, 30]

    print('for centroid - 1: ')
    while True:
        clusters = []
        for i in range(k):
            clusters.append([])
        for i in dataset:
            if abs(c1[0] - i) < abs(c1[1] - i):
                clusters[0].append(i)
            else:
                clusters[1].append(i)

        print(clusters)
        newC1 = [0] * len(c1)
        for i in range(len(clusters)):
            s = 0
            for j in range(len(clusters[i])):
                s += clusters[i][j]
            newC1[i] = s / len(clusters[i])
        if (c1[0] == newC1[0] and c1[1] == newC1[1]):
            print('centroids are equal')
            print('new centroids are', newC1[0], newC1[1])
            break
        else:
            c1[0] = newC1[0]
            c1[1] = newC1[1]


    print('for centroid - 2: ')
    while True:
        clusters = []
        for i in range(k):
            clusters.append([])
        for i in dataset:
            if abs(c2[0] - i) < abs(c2[1] - i):
                clusters[0].append(i)
            else:
                clusters[1].append(i)

        print(clusters)
        newC2 = [0] * len(c2)
        for i in range(len(clusters)):
            s = 0
            for j in range(len(clusters[i])):
                s += clusters[i][j]
            newC2[i] = s / len(clusters[i])
        if (c2[0] == newC2[0] and c2[1] == newC2[1]):
            print('centroids are equal')
            print('new centroids are', newC2[0], newC2[1])
            break
        else:
            c2[0] = newC2[0]
            c2[1] = newC2[1]

    print('question A done')


def questionB() :
    # take input from the csv
    df = pd.read_csv('data.csv')
    
    # read from csv file and convert into list
    dataset = df['distance']
    
    # no of clusters
    k = 2

    # no of centroids
    noOfCentroid = 2
    c1 = [15, 32]
    c2 = [12, 30]

    print('for centroid - 1: ')
    clusters = []
    for i in range(k):
        clusters.append([])
    for i in dataset:
        if abs(c1[0] - i) < abs(c1[1] - i):
            clusters[0].append(i)
        else:
            clusters[1].append(i)

    print(clusters)
    sse = 0
    for i in range(len(clusters)):
        for j in range(len(clusters[i])):
            sse += abs(clusters[i][j] - c1[i]) ** 2
    print('SSE =', sse / 2)

    print('for centroid - 2: ')

    clusters = []
    for i in range(k):
        clusters.append([])
    for i in dataset:
        if abs(c2[0] - i) < abs(c2[1] - i):
            clusters[0].append(i)
        else:
            clusters[1].append(i)

    print(clusters)
    sse = 0
    for i in range(len(clusters)):
        for j in range(len(clusters[i])):
            sse += abs(clusters[i][j] - c2[i]) ** 2
    print('SSE =', sse / 2)

    print('question B done')

# Divide into clusters
questionA()
# Calculate SSE (Sum of Square Error)
questionB()

