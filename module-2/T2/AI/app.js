function observes () {
    // child watches father walking
    console.log('infant observing the surroundings!!!');
    description.innerText = 'infant observing the surroundings!!!';
}

function fatherSupports () {
    // father holds child and makes him to walk
    console.log('father supports infant to walk');
    description.innerText = 'father supports infant to walk';
}

function fatherTrainsInfant() {
    // count 
    countFatherTrains++;
    console.log('count of Father trains = ' + countFatherTrains);
    description.innerText = `count of Father trains = ${countFatherTrains}`;
}

function fatherCalls() {
    // this function should return true or false randomly
    if (Math.random() > .7) 
        return true;
    else 
        return false;
}

function ageChanger() {
    let ages = [3, 6, 9, 12, 15, 18];
    // set age to random number from ages array
    age = ages[Math.floor(Math.random() * ages.length)];
    console.log('current age is ' + age);
    description.innerText = `current age is ${age}`;
}

function trysToCrawl() {
    let hasFatherCalled = fatherCalls();
    if (!hasFatherCalled) {
        console.log('father has not called');
        description.innerText = 'father has not called';
    } 
    else {
        if (countFatherTrains > 3 && (age >= 6 && age <= 9)) {
            console.log('image showing an infant trying to crawl');
            description.innerText = 'image showing an infant trying to crawl';
        }
        else {
            console.log('still learning!!!');
            description.innerText = 'still learning!!!';
        }
    }
}

function crawls() {
    let hasFatherCalled = fatherCalls();
    if (!hasFatherCalled) {
        console.log('father has not called');
        description.innerText = 'father has not called';
    }
    else {
        if (countFatherTrains > 7 &&  (age >= 10 && age <= 11)) {
            console.log('infant crawls');
            description.innerText = 'infant crawls';
        }
        else {
            console.log('still learning!!!');
            description.innerText = 'still learning!!!';
        }
    }
}

function trysToStand() {
    countChildTrysToStand++;
    console.log('trying to stand!!!');
    description.innerText = 'trying to stand!!!';
}

function stands () {
    if (countChildTrysToStand > 5 && (age >= 10 && age <= 15)) {
        // stands successfully
        console.log('child stands');
        description.innerText = 'child stands';
    }
    else {
        console.log('child still learning!!!!');
        description.innerText = 'child still learning!!!!';
    }
}

function trysToWalk() {
    coundChildTrysToWalk++;
    console.log('trying to walking!!');
    description.innerText = 'trying to walking!!';
}

function walks() {
    if (coundChildTrysToWalk > 6 && (age > 15 && age < 20)) {
        console.log('child walks');
        description.innerText = 'child walks';
    }
    else {
        console.log('child still learning!!!!');
        description.innerText = 'child still learning!!!!';
    }
}

let countFatherTrains = 0;
let countChildTrysToStand = 0;
let coundChildTrysToWalk = 0;
let age = 0;
let description = document.getElementById('description');


