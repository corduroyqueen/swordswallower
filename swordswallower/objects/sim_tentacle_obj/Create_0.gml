//fuck yes
num_rings = 20

ks = 50.0 //stiffness
lo = 10
mass = 1
grav = 0.4

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
	ds_list_add( rings_x, x +n +  n * lo * dcos(270) )
	ds_list_add( rings_y, y +n+ n * lo * -dsin(270) )
	ds_list_add( rings_hsp, 0 )
	ds_list_add( rings_vsp, 0 )
	if n>0 {
		ds_list_add( spring_x, rings_x[| n])
		ds_list_add( spring_y, rings_y[| n])
		ds_list_add( spring_axx, rings_x[| n-1]-rings_x[| n])
		ds_list_add( spring_axy, rings_y[| n-1]-rings_y[| n])
		ds_list_add( spring_hsp, 0 )
		ds_list_add( spring_vsp, 0 )
	}
	n++
}
ds_list_add( spring_hsp, 0 )
		ds_list_add( spring_vsp, 0 )