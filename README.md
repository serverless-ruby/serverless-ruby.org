
# Serverless Ruby

* https://www.serverless-ruby.org/

Built in Ruby on Rails hosted on AWS Lambda using[Lamby](https://lamby.custominktech.com/docs/quick_start)

Yes this is Serverless Ruby on Rails !


## How it works

Amazing dude [Ken Collins](https://twitter.com/metaskills) crated [Lamby](https://lamby.custominktech.com/docs/quick_start) which is a tool that wraps Ruby on Rails app into Docker container, pushes it into Docker registry AWS ECR and initializes AWS Lambda funcion that enables it to be triggerd by a API Gateway web request call.

so Request > API Gateway > Lambda > Docker > Rails

## Rails app

* Ruby 2.7.2
* [Ruby on Rails](https://rubyonrails.org/) (v 6.0.3)
* records saved to DynamoDB
* ~~Redis as a cache server~~ ([removed](https://github.com/serverless-ruby/serverless-ruby.org/commit/b74452eb8a2b06e05aca32b7cf1e6eb5be923d49) to save cost)
* [Hotwired Turbo](https://hotwired.dev/) on the FE compiled by [webpacker](https://github.com/rails/webpacker)
* Everything wrapped in Docker image

## Notes to maintainers

#### to deploy

* make sure you have credential file in `./.env.production`
* make sure you have the correct profile set to **default** in  `.aws/credentials`

```
./bin/deploy

```

#### AWS

AWS account for this project is separate AWS account outside any specific person (t...+severless@gmail.com).
Region `us-east-1`
