main (){
var x = "main";
var y = "main";

foo (){
        print ("Initially in foo x: " + x);
        //print ("Initially in foo y: " + y);
        //error
        var y = "y in foo";
        x="x in foo";
        print ("Initially in foo y: " + y);
        print ("Initially in foo x: " + x);
        print ("");
        foo1(){
        
            print ( "In foo1 x: " + x + ", y: " + y);
            x = "x in foo1";
            y = "y in foo1";
            print ( "End foo1 x: " + x + ", y: " + y);
            print ("");
        }

        foo2(){
            print ( "In foo2 x: " + x + ", y: " + y);
            x = "x in foo2";
            y = "y in foo2";
            print ("End foo2 x: " + x + ", y: " + y);
            print ("");
            foo1();
            
        }

        foo3(){
            print ("In foo3 y: " + y);
            y = "y in foo3";
            print ("In foo3 y: " + y);
            var x = "x in foo3";
            print ("In foo3 x: " + x );
            print ("");
            foo1();
    }
    foo3();
    print ( "After foo3 in foo: " + x + ", y: " + y);
    print ("");
    foo2();
    print( "After foo2 in foo: " + x + ", y: " + y);
    print ("");
    }
print("Before foo in main x: " + x + ", y: " + y);
print ("");
foo();
print("After foo in main x: " + x + ", y: " + y);
}
