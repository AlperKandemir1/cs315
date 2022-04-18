<html>
<head>
</head>
<body>

<?php
$x = "global" ;
$y = "global" ;
function foo () {
    //echo "In foo x: " .$x . " y: ". $y. "\n"  ;
    $x = "x in foo" ;
    $y = "y in foo" ;
    echo "In foo x: " .$x . " y: ". $y. "<br>"  ;  
    echo "<br>";
    function foo1 () {
        $x = "x in foo1" ;
        global $y ;
        $y = "y in foo1" ;
        echo "In foo1 x: " .$x . " y: ". $y. "<br>"  ;
        echo"<br>";
        function foo2 () {
            $x = "x in foo2" ;
            $y = $GLOBALS [ 'y' ];
            $y = "y in foo2" ;
            echo "End In foo1 x: " .$x . " y: ". $y. "<br>"  ;
        }
        foo2 ();
        echo "End foo2 in foo1 x : ". $x . " y: ". $y. "<br>"  ;
        foo3 ();
        echo "End foo3 in foo1 x : ". $x . " y: ". $y. "<br>"  ;
        echo"<br>";
    }
    function foo3 () {
        $x = "x of foo3" ;
        //echo "in foo3 x:  ". $x . " y: ". $y. "<br>"  ;
        echo "in foo3 x:  ". $x;
        echo"<br>";
        
    }
    foo1 ();
    echo "End foo1 in foo x:  ". $x . " y: ". $y. "<br>"  ;
    foo3 ();
    echo "End foo3 in foo x:  ". $x . " y: ". $y. "<br>"  ;
    echo"<br>";
}
foo ();
echo "End foo in global x:  ". $x . " y: ". $y. "<br>"  ;
?>

</body>
</html>
