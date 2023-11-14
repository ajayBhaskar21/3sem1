
function observes () {


    // child watches father walking

}

function fatherSupports () {
    // father holds child and makes him to walk

}

function fatherTrainsInfant() {
    // count 
    countFatherTrains++;
}

function fatherCalls() {
    // this function should return true or false randomly
    if (Math.random() > .7) 
        return true;
    else 
        return false;
}

function ageChanger() {
    let ages = [];
    for (let i = 0; i <= 15; i ++) 
        ages.push(i);
    
    // set age to random number from ages array
    age = ages[Math.floor(Math.random() * ages.length)];
}

function trysToCrawl() {

    if (countFatherTrains > 3 && fatherCalls() && (age >= 6 && age <= 9)) {
        console.log('image showing an infant crawls');
    }

}

function crawls() {

    if (countFatherTrains > 7 && fatherCalls() && (age >= 10 && age <= 11)) {
        console.log('infant crawls');
    }

}

function trysToStand() {

    if (fatherCalls() && (age >= 12 && age <= 15)) {
        // count ++;
    }
    return count;
}

function stands () {

    if (trysToStand() > 5) {
        // stands successfully
    }

}



let countFatherTrains = 0;
let age = 0;

