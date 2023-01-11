module.exports =  ({ env }) => ({
	connection: {
		client: 'postgres',
		connection: {
		host: env('DATABASE_HOST', 'host.docker.internal'),
			port: env.int('DATABASE_PORT', 5432),
			database: env('DATABASE_NAME', 'postgres'),
			user: env('DATABASE_USERNAME', 'postgres'),
			password: env('DATABASE_PASSWORD', 'admin'),
			ssl: env.bool('DATABASE_SSL', false)
		}
	}
});
