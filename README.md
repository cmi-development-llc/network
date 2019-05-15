# Static Wordpress site generator
This is a set of cloudformation templates and a bash script that will help create a static wordpress ecosystem.

# Architecure Diagram
![](Wordpress-Static.png?raw=true)

# Deployment

Configure your AWS credentials like so:
```bash
aws configure
```
or have your session prepared to have access to valid credentials.

```bash
cd scripts
./upload-to-cfn.sh
```

