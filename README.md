# ec2-copy-snapshot

This is a script to copy snapshots between AWS regions.

## Installation

    $ gem install ec2-copy-snapshot

## Usage

```
$ ec2-copy-snapshot 
Usage: copy_snapshot_between_regions [options] snapshot-id
        --aws-access-key ACCESS_KEY  AWS Access Key (default: AWS_ACCESS_KEY_ID)
        --aws-secret-access-key SECRET_KEY
                                     AWS Secret Access Key (default: AWS_SECRET_ACCESS_KEY)
        --from-region REGION         AWS Region to copy snapshot FROM (default: us-east-1)
        --to-region REGION           AWS Region to copy snapshot TO
        --from-instance HOSTNAME     Hostname of an instance in the source region to use for the copy
        --to-instance HOSTNAME       Hostname of an instance in the target region to use for the copy
        --[no-]keep-volume           Keep the destination volume the new snapshot is made from (default: no)
```

All options must be defined.

You must be able to login to both `--from-instance` and `--to-instance` and execute sudo commands as whatever user you are logged in as.

Here's what happens:

1. A new volume is created from the supplied snapshot in the same AZ as the `--from-instance`.
2. A new volume of the same size as the snapshot is created in the same AZ as `--to-instance`.
3. The new volumes are attached to `--from-instance` and `--to-instance` using an available device.
4. The contents of the source volume are sent via ssh to the destination volume. If `pv` is installed on the source instance, you will see a progress indicator.
5. A snapshot is taken of the volume in the destination region.
6. The temporary volumes are detached and deleted.

*Note*: Right now, the volume is sent block for block (but compressed)
across regions. That can take awhile, but gives an identical snapshot in
the destination region. In the future, I may add a filesystem-level copy
that would be faster.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

