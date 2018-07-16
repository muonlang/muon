a = [1,2] // basic matrix
b = [a, 3] // [1, 2, 3]
b = [a; 3, 4] // [1,2;3,4]
c = a&[m] // convert a to meters
d = c&[s] // d is now in [m*s]

f = d * 1[m/ft] // useless

print f@[m] // strips units basically. under the hood it is just division
print f~[ft*hr] // converts before printing
print f&[m] // multiplies by 1[m] basically. opposite of @

print f@[m]~[hr] // strips m and converts to hr

g = [3;4][AU] // yep

print #b // [2,2]
print prod(#b) // 4

print norm(g) // should be 5[AU]
print norm(g)~[km] // the implication is that we need to treat ~,@,and & as operators

b = <"hello", a> // List
c = <b, true> // <<"hello",[1,2]>,true>

c.append("asdf") // <<"hello",[1,2]>,true,"asdf">

// insert, pop, prepend, etc

b = "true"~Bool // ~ is basically the convert/cast operator

// types: [units], Num, Str, Bool, [w,h][units], List

[x,y] = [1,2] // matrix decomposition
<x,y> = <1,2> // list decomposition

[w,h] = #[1,2;3,4]

a[1] // first element of a
c< -1 > = 7 // last element of c set to 7

a[a > 0] = 4 // matrix subset assignment

squareSum1(v) -> {
	n = norm(v)
	<- n^2
}
squareSum2(v) -> sum(v .^ 2)
squareSum3(v) -> {
	<- sum({
		m = prefill(0, #v)
		for [1:1:$v] as i { // $v = prod(#v)
			m = v[i]^2
		}
		<- m
	})
}

foldLeft(v,acc,f) -> {
	for [1:1:$v] as i {
		acc = f(v[i],acc)
	}
	<- acc
}
v := [1,2,3]
acc = 1
foldLeft(v,acc,(z,acc)->z*acc) // product 1*2*3 = 6
