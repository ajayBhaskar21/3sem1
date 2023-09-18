<?php declare (strict_types = 1); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class PHP</title>
</head>

<body>

    <?php
        $name = "bot";
        print(" <h1>Welcome here $name</h1> ");

        echo "<h3>Indexed array </h3>";
        $a[0] = 'zero';
        $a[] = 'last';

        print("array = $a[0] ---- $a[1]<br>");

        for ($i = 0; $i < count($a); $i ++) {
            print("$a[$i]<br>");
        }


        $sec = array('one', 'two', 2222, 2333.5);
        for ($i = 0; $i < count($sec); $i++) {
            print("second = $sec[$i] <br>");
        }

        echo "<h3>Associative array </h3>";
        
        $third['Artic'] = 22;
        $third['goa'] = 30;
        $third['mumbai'] = 100;

        foreach( $third as $element => $value) 
            print("$element : $value<br>");

        echo "<h3>sort in array</h3>";
        $arr = array('aaa', 52, 885, 'anoty', 'op', '1', '12');

        for($i = 0; $i < count($arr); $i++) {
            print("$arr[$i] ");
        }
        echo "<br>";
        sort($arr);
        for ($i = 0; $i < count($arr); $i++) {
            print("$arr[$i] ");
        }
        echo "<br> <h3> IF </h3>";
        $check = 2;
        IF ($check == 1) echo "if condition";
        ELSE echo "else condition";
        echo "<br> <h3> Function </h3>";
        myfunc();
        global $ll ;
       
        function myfunc () {
            $ll = 200;
            //$ll = true;
            echo "function things $ll";
            $ll = "Changed var";
        }
        $ll = 3000;
        echo "outside func $ll";
        echo "<br>";
        function dump() {
            $pp = 9990;
            print(var_dump($pp));
            var_dump($pp);
        }
        dump();
        echo "<br>";

        echo "<h3>For each loop in PHP</h3>";

        $arr1 = array(20, 30, 399, 290);
        foreach($arr1 as $i) {
            echo "$i ";
        }
        echo "<br>";

        echo "function names are not case sensitive.<br>";

        function testFun() {
            echo "testFun() is a function.";
        }
        TESTFUN();
        echo "<br>";
        function colorName ($color) {
            echo "color : $color <br>";
        }
        colorName('Red');
        colorName('Blue');
        colorName(5555);
        echo "<br>";
        function add(int $a, int $b) {
            return $a + $b;
        }
        echo add(50, 5);
        echo "<br>";

        function addNumbers(int $a, int $b)
        {
            return $a + $b;
        }
        //echo addNumbers(5, "5"); // will throw error because we used declare(strict_types=1); in first line.

        echo addNumbers(5, 5); 
        echo "<br>";

        function mul(int $a, int $b) {
            return $a * $b;
        }

        echo "mul of two numbers 2 and 3 =  " . mul(2, 3). "<br>";
        echo "mul of 9 * 10 = ". mul (9, 10) . "<br>";


        function division (float $a, float $b) : int {

            return (int) ($a / $b);
        }

        echo "division of 5 and 2 = " . division(5, 2) ."<br>";

        echo "<h3>Arguments by reference</h3>";

        function argRef(&$value) {
            $value += 5;
        }
        $num = 2;
        echo "before reference = $num<br>";
        argRef($num);
        echo "after reference = $num<br>";

        echo "<h3>Associative Array declaration</h3>";

        $assArr = array("4010" => "ajay",  "035" => "Jyoshna", "4555" => "Manasa");

        foreach ($assArr as $element => $value) {
            print("$element = $value <br>");
        }

        foreach ($assArr as $key) {
            echo "value = $key<br>"; 
        }





    ?>  


</body>

</html> 