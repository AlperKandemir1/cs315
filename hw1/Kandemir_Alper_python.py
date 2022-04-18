x = "global"
y = "global"
def foo ():
    #print ("Initially in foo x: " , x)
    #error because x cannot be used before initialization
    print ("Initially in foo y: " , y)
    #y value is global value. No y variable in this block
    x="x in foo"
    print ("Initially in foo x: " , x)
    def foo1 ():
        global x
        # x is global x
        print ()
        print ("in foo1 x: ", x)
        x = "x in foo1"
        y = "y in foo1"
        print ( "In foo1 x: " , x + ", y: " + y)

        def foo2 ():
            nonlocal y
            #y will be searched at outer scope
            print ()
            print ( "in foo2 y: " , y)
            x = "x in foo2"
            y = "nonlocal y in foo2"
            print ("end foo2: " , x + ", y: " + y)

        foo2()
        print ()
        print ("exit foo2: " , x + ", y: " + y)
        foo3()
        print ("exit foo3: " , x + ", y: " + y)
        #y value is global value
    def foo3 ():

        y = "y foo3"
        print ()
        print ("In foo3 y: "  + y)

    foo1()
    print ()
    print ("exit foo1 x: " , x + ", y: " + y)
    #y value is global value. No y variable in this block
    foo3()
    print ("exit foo3: " , x + ", y: " + y)
    #y value is global value. No y variable in this block
foo()
print ()
print ("global x:" , x + ", global y: " + y)
# global x is changed in the function because of global keyword
#{
#x="block x"
#print (" x:" , x)
#}
#syntax error
