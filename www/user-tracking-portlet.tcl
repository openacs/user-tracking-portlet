ad_page_contract {

    The logic for the user-tracking portlet.

    @creation-date 2004-10-25
    @author David Ortega (doa@tid.es)

} -query {
} -properties {
	community_id_p: onevalue
	community_id: onevalue
	admin_p: onevalue  
	user_id: onevalue 
}

array set config $cf
set list_of_package_ids [lsort $config(package_id)]

set community_id [dotlrn_community::get_community_id]
set user_id [ad_conn user_id]

if {[exists_and_not_null community_id]} {
	set community_id_p 1
	if {[exists_and_not_null user_id]} {
		db_0or1row get_user_info {} -column_array user
	}	
set admin_p [ad_permission_p $community_id admin]

} else {
	set admin_p [ad_permission_p [ad_conn package_id] admin]
	set community_id_p 0
	if {[exists_and_not_null user_id]} {
		db_0or1row get_user_info {} -column_array user
	}	
}
ad_return_template 
