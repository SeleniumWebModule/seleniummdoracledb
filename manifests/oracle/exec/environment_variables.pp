class selenium_md_oracledb::oracle::exec::environment_variables {
	file {'oracle_env.sh':
		ensure => file,
    	path    => '/etc/profile.d/oracle_env.sh',
    	owner   => 'root',
    	content => template("selenium_md_oracledb/oracle_env.sh.erb"),
    	mode    => '0775',
  	} -> 

  	exec{'run_profile':
  		command => 'sh /etc/profile.d/oracle_env.sh',
  		user    => 'root',
  		path    => '/usr/bin'
  	}
}