/// @description draw
shader_set(rbw_shd);
shader_set_uniform_f(Res,255,255,0); 
shader_set_uniform_f(Time,current_time/1000); 
draw_self(); 
shader_reset(); 
/*
shader_set(rbw_shd);
var shader_params = shader_get_uniform(rbw_shd, "u_vParams");
shader_set_uniform_f(shader_params, 0.1, 0.8, 0.25);
draw_self();
shader_reset();