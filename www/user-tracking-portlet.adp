<if @community_id_p@ ne 0>
   #user-tracking-portlet.General_Options#
   <ul>
  	<li>
             <a href="/user-tracking/users-card?user_id=@user_id@"> #user-tracking-portlet.see_your_site_stats#</a>
       </li>
       <li>
             <a href="/user-tracking/lanza?community_id=@community_id@&user_id=@user_id@&config=user&sitedomain=@sitedomain_all@"> #user-tracking-portlet.See_your_community_stats# </a>
       </li>
   
     </ul>
   <if @admin_p@ ne 0>
   #user-tracking-portlet.Admin_options#
   <ul>
       <li>
             <a href="/user-tracking/communities-card?community_id=@community_id@"> #user-tracking-portlet.see_community_stats# </a>
       </li>
       <if @site_wide_admin_p@ ne 0>
       <li>
       	     <a href="/user-tracking/site-card"> #user-tracking-portlet.see_site_stats# </a>
       </li>
       <li>
             <a href="/user-tracking/lanza"> #user-tracking-portlet.user_tracking_access_package#</a>
       </li>
       </if>
   </ul>
   </if>
</if>
<else>
#user-tracking-portlet.General_Options#
<ul>
  <li>
        <a href="/user-tracking/users-card?user_id=@user_id@"> #user-tracking-portlet.see_your_site_stats#</a>
  </li>

</ul>
<if @site_wide_admin_p@ ne 0>
#user-tracking-portlet.Admin_options#
<ul>
  <li>
        <a href="/user-tracking/site-card"> #user-tracking-portlet.see_site_stats# </a>
  </li>
  <li>
        <a href="/user-tracking/lanza"> #user-tracking-portlet.user_tracking_access_package#</a>
  </li>
</ul>
</if>
</else>




