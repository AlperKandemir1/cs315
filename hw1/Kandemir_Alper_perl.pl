$x = "global" ;
$y = "global" ;
sub foo {
    print "Initially in foo x: ", $x ," y: ", $y ;
    print"\n";
    
    $x = "x in foo" ;
    $y = "y in foo" ;
    print "In foo x: ", $x ," y: ", $y  ;
    print"\n";
    print"\n";
    sub foo1 {
        print "In foo1 x: ", $x ," y: ", $y  ;
        print"\n";
        $x = "x in foo1" ;
        my $y = "static y in foo1" ;
        print "In foo1 x: ", $x ," y: ", $y ;
        print"\n";
        print"\n";
        sub foo2 {
            print "In foo2 x: ", $x ," y: ", $y ;
            print"\n";
            $x = "x in foo2" ;
            $y = "y in foo2" ;
            print "exit foo2 x: ", $x ," y: ", $y  ;
            print"\n";
            print"\n";
        }
        foo2();
        print "End foo2 in foo1 x: ", $x ," y: ", $y ;
        print"\n";
        foo3();
        print "End foo3 x: ", $x ," y: ", $y  ;
        print"\n";
        print"\n";
    }
    sub foo3 {
        print "In foo3 x: ", $x ," y: ", $y  ;
        print"\n";
        $x = "x in foo3" ;
        $y = "y in foo3" ;
        print "End foo3 x: ", $x ," y: ", $y  ;
        print"\n";
        print"\n";
    }
    foo1();
    print "End foo1 x: ",  $x ," y: ", $y  ;
    print"\n";
    foo3();
    print "End foo3 x: ", $x ," y: ", $y  ;
    print"\n";
    print"\n";
}
foo();
print "Global x: ", $x ,"y: ", $y ;
print"\n";
