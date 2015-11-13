# Tiny Puppet Acceptance Tests

In this repo are gathered the results of acceptance tests of [Tiny Puppet](http://www.tiny-puppet.com)'s support for applications and profiles.

## Setup

To install and setup the testing environment (Needed: git, Vagrant, Virtual Box r10k):

    git clone https://github.com/example42/tp-acceptance
    cd tp-acceptance
    r10k puppetfile install
    vagrant status

The default [Vagrantfile](https://github.com/example42/tp-playground/blob/master/Vagrantfile#L3) uses the cachier plugin, you can install it with (comment thesecond line of Vagrant file (```config.cache.auto_detect = true```) if you don't want to use/install it:

    vagrant plugin install vagrant-cachier

The repository structure:

     Puppetfile  # Module to install via r10k o librarian-puppet
     Vagrantfile # Vagrant environment configuration
     bin/        # Contains scripts used fors tests
     hieradata/  # Contains hieradata used in Vagrant's Puppet envirorment
     manifests/  # Manifests 
     modules/    # External modules directory. Populated by r10k
     modules_local # Local modules directory


### Applications acceptance tests

The ```bin/test_app.sh``` script is the quickest way to test how Tiny Puppet manages different applications on different Operating Systems.

You need to run the VM you want to test on:

    vagrant up Ubuntu1404

and then execute commands like these:

  - To test apache installation on Ubuntu1404:

    ```bin/test_app.sh apache Ubuntu1404```

  - To test ALL the supported applications on Centos7:

    ```bin/test_app.sh all Centos7```

  - To test ALL the applications on Centos7 and save the results in the ```acceptance``` dir:

    ```bin/test_app.sh all Centos7 acceptance```

  - To test an application on all the running VMs and save the results in the ```acceptance``` dir:

    ```bin/test_app.sh munin all acceptance```

  - To run puppi check for proftpd applications on Centos7:

    ```bin/test_app.sh all Centos7 puppi```

  - To run acceptance tests for all the supported applications on all the running VMs:

    ```bin/test_app.sh all all acceptance```


Do not expect everything to work seamlessly, this is a test environment to verify functionality and coverage on different Operating Systems. 


### [Compatibility matrix](acceptance.md)

Routinely the results of acceptance tests are saved in the [```acceptance```](https://github.com/example42/tp-playground/tree/master/acceptance)  directory: use it as a reference on the current support matrix of different applications on different Operating Systems.

A sumup of the tests is in the [```Compatibility Matrix```]acceptance.md) which is updated regularly.

Note however that Tiny Puppet support may extend to other OS: the acceptance tests use directly ```puppet apply``` on ```tp``` defines, so they need to run locally and have the expected prerequisites (such as the Ruby version).

Note also that some tests fail for trivial reasons such as the absence of a valid configuration file by default or missing data to configure dedicated repositories or execution order issues while running tests on the same VM or errors in the test scripts.

Check the output of the check scripts, under the ```success``` and ```failure``` directories for some details on the reasons some tests are failing.

