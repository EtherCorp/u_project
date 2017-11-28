# Unicorn Project

## How to set up project
- Install ruby with rails and bundle gems
- Install yarn
- Install postgresql
- (Optional) create a new postgres user
    - Change to default postgres user: `sudo -u postgres -i`
    - Open postgres console: `psql`
    - Create new role for this project: `create role ether createdb login password 'unicorn';`, exit `\q`
    - Return to default user: `exit`
- Configure your database credentials in `/config/database.yml`
    - We provide a default configuration in `/config/database.yml.default`
- Install required gems
    - Open terminal in `<ProjectPath>/centers-api/`
    - Install gems: `bundle install`
- Create databases: `bundle exec rake db:setup`

## How to run Unicorn
- Migrate databases: 
    - `bundle exec rake db:create`
    - `bundle exec rake db:migrate`
- Install React
    - `bundle exec rails webpacker:install`
    - `bundle exec rails webpacker:install:react`
    - If the script ask to override a file because a conflict, type `n` and press enter
- Update JavaScript packages
    - `yarn install`
- Run server: `bundle exec rails server`
