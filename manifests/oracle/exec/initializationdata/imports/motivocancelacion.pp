class selenium_md_oracledb::oracle::exec::initializationdata::imports::motivocancelacion {
	require selenium_md_oracledb::oracle::exec::initializationdata::imports::funcionsistema

	$pathFile = "${selenium_md_oracledb::oracleHome}/scripts/initializationdata/imports"

	file {'insert_motivo_cancelacion':
		ensure => file,
		path   => "${pathFile}/motivo_cancelacion.sql",
		owner  => 'oracle',
		group  => 'dba',
		mode   => '0770',
		content => template("selenium_md_oracledb/initializationdata/imports/motivo_cancelacion.sql.erb")
	} ->

	exec {'insert_motivo_cancelacion':
		command     => "sqlplus ${selenium_md_oracledb::systemusr}/${selenium_md_oracledb::systempass} as sysdba @motivo_cancelacion.sql > insert_motivo_cancelacion.log",
		path        => "${selenium_md_oracledb::oracleHome}/bin:/usr/bin",
		cwd         => $pathFile,
		user        => 'oracle',
		environment => ["ORACLE_HOME=${selenium_md_oracledb::oracleHome}", "ORACLE_SID=${selenium_md_oracledb::sid}"],
		unless      => "test -f insert_motivo_cancelacion.log",
		timeout     => 0
	}  
}