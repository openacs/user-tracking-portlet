

declare  
	ds_id portal_datasources.datasource_id%TYPE;
	v_impl_id acs_sc_impls.impl_id%TYPE;
begin

	select datasource_id into ds_id
	from portal_datasources
	where name = 'user_tracking_portlet';

	if not found then
		RAISE EXCEPTION ' No datasource id found ', ds_id;
		ds_id := null;
	end if;

	if ds_id is NOT null then
		portal_datasource.del(ds_id);
	end if;

-- drop the hooks
	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'GetMyName'
	);

	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'GetPrettyName'
	);


	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'Link'
	);

	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'AddSelfToPage'
	);

	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'Show'
	);

	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'Edit'
	);

	v_impl_id := acs_sc_impl_alias.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet',
		impl_operation_name	=> 'RemoveSelfFromPage'
	);

-- Drop the binding
	acs_sc_binding.delete (
		contract_name	=> 'portal_datasource',
		impl_name		=> 'user_tracking_portlet'
	);

-- drop the impl
	acs_sc_impl.del (
		impl_contract_name	=> 'portal_datasource',
		impl_name			=> 'user_tracking_portlet'
	);

end;
/
show errors

@@ user-tracking-admin-portlet-drop.sql
