ad_page_contract {

    The logic for the user-tracking portlet.

    @creation-date 2004-10.25
    @author David Ortega (doa@tid.es)

} -query {
} -properties {
	community_id_p: onevalue
	community_id: onevalue
	admin_p: onevalue  
	user_id: onevalue 
	site_wide_admin_p: onevalue
}

array set config $cf

#set shaded_p $config(shaded_p)
set list_of_package_ids [lsort $config(package_id)]
ns_log notice "La lista de packages ids es: $list_of_package_ids"
#set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]

set community_id [dotlrn_community::get_community_id]
ns_log notice "El community id es: $community_id" 
set user_id [ad_conn user_id]
if {[exists_and_not_null user_id]} {
	set site_wide_admin_p [acs_user::site_wide_admin_p -user_id $user_id]
} else {
	set site_wide_admin_p 0
}

if {[exists_and_not_null community_id]} {
	set community_id_p 1
	if {[exists_and_not_null user_id]} {
		db_0or1row get_user_info {} -column_array user
		set sitedomain_all "${user(first_names)} ${user(last_name)} [_ user-tracking-portlet.in_the_community] $community_id"
		set sitedomain "${user(first_names)} ${user(last_name)}"
		set sitedomain_comm "Comunidad $community_id"
	} else {
		set sitedomain_comm "Comunidad $community_id"
	}	
set admin_p [ad_permission_p $community_id admin]

} else {
	set admin_p [ad_permission_p [ad_conn package_id] admin]
	set community_id_p 0
	if {[exists_and_not_null user_id]} {
		db_0or1row get_user_info {} -column_array user
		set sitedomain "${user(first_names)} ${user(last_name)}"
	} else {
		set sitedomain "[ad_system_name]"
	}	
}




ns_log notice "El user id es $user_id"
ns_log notice "El admin_p es $admin_p"
#set admin_p [ad_permission_p $config(package_id) admin]
#set admin_p [ad_permission_p $community_id admin]
#ns_log notice "[ad_conn package_id]"
#Si el community_id es cero es que estoy en la página principal del usuario. Solo debería dejar ver estadísticas del usuario en sus comunidades.
#A no ser que sea admin.

ad_return_template 
