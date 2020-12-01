//fuck yes
//fuck yes
//fuck yes


ks = 60  //stiffness
lo = 20
mass = 50
grav = 0.1

ks = 10  //stiffness
lo = 20
mass = 16
grav = 0.033

ks = 2.0  //stiffness
lo = 0.5
lo = 20
mass = 1
grav = 0.2
fric = 0.01


ks = 2.0  //stiffness
lo = 20
mass = 1
grav = 0.2

lo = 40

dt = 0.5

pinned = true
held_timer=0
sinc=0

//ks= 240
//mass = 45
//grav = 0.8
//grav = 0.1

rings_x = ds_list_create()
rings_y = ds_list_create()
rings_hsp = ds_list_create()
rings_vsp = ds_list_create()


spring_x = ds_list_create()
spring_y = ds_list_create()
spring_axx = ds_list_create()
spring_axy = ds_list_create()
spring_hsp = ds_list_create()
spring_vsp = ds_list_create()

n=0
while n<num_rings {
	ds_list_add( rings_x, x + n * lo * dcos(300) )
	ds_list_add( rings_y, y + n * lo * -dsin(300) )
	ds_list_add( rings_hsp, 0 )
	ds_list_add( rings_vsp, 0 )
	
	n++
}

ds_list_add( spring_x, rings_x[| n])
ds_list_add( spring_y, rings_y[| n])
ds_list_add( spring_axx, 0)
ds_list_add( spring_axy, 0)
ds_list_add( spring_hsp, 0 )
ds_list_add( spring_vsp, 0 )
n=1
while n<num_rings {
	ds_list_add( spring_x, rings_x[| n])
	ds_list_add( spring_y, rings_y[| n])
	ds_list_add( spring_axx, rings_x[| n-1]-rings_x[| n])
	ds_list_add( spring_axy, rings_y[| n-1]-rings_y[| n])
	ds_list_add( spring_hsp, 0 )
	ds_list_add( spring_vsp, 0 )
	n++
}
addfx = 0
addfy = 0

run = false
