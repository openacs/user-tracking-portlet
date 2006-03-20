
declare
    ds_id portal_datasources.datasource_id%TYPE;
begin

    ds_id := portal_datasource.new(
        name => 'user_tracking_admin_portlet',
        description => 'User Tracking Admin Portlet'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'shadeable_p',
        value => 'f'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'hideable_p',
        value => 'f'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'user_editable_p',
        value => 'f'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'shaded_p',
        value => 'f'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 't',
        key => 'link_hideable_p',
        value => 't'
    );

    portal_datasource.set_def_param (
        datasource_id => ds_id,
        config_required_p => 't',
        configured_p => 'f',
        key => 'package_id',
        value => ''
    );

end;
/
show errors

declare
    foo integer;
begin

    -- create the implementation
    foo := acs_sc_impl.new (
        impl_contract_name => 'portal_datasource',
        impl_name => 'user_tracking_admin_portlet',
        impl_pretty_name => 'User Tracking Admin Portlet',
        impl_owner_name => 'user_tracking_admin_portlet'
    );

    -- add all the hooks
    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'GetMyName',
        'user_tracking_admin_portlet::get_my_name',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'GetPrettyName',
        'user_tracking_admin_portlet::get_pretty_name',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'Link',
        'user_tracking_admin_portlet::link',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'AddSelfToPage',
        'user_tracking_admin_portlet::add_self_to_page',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'Show',
        'user_tracking_admin_portlet::show',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'Edit',
        'user_tracking_admin_portlet::edit',
        'TCL'
    );

    foo := acs_sc_impl.new_alias(
        'portal_datasource',
        'user_tracking_admin_portlet',
        'RemoveSelfFromPage',
        'user_tracking_admin_portlet::remove_self_from_page',
        'TCL'
    );

    -- Add the binding
    acs_sc_binding.new(
        contract_name => 'portal_datasource',
        impl_name => 'user_tracking_admin_portlet'
    );

end;
/
show errors
