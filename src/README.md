# Scheduler-rust

Use cron-like scheduling in an async tokio environment.
Also schedule tasks at an instant or repeat them at a fixed duration.

## 

## Usage

1, Clone this repo
2, docker build . -t scheduler-rust:v1
3, docker run scheduler-rust:v1

A JobScheduler is created, hashmap jobs_to_run is created to store jobs. You can add/stop/remove jobs, or clear the job hashmap. 

You can create 3 types of job:
CronJob: cron like job, runs on specified UTC time
OneShot: runs once in a duration
Repeated: runs repeatly at a fixed interval

If you are creating a cron like job, please use the `FromStr` impl for the
`Schedule` type of the [cron](https://github.com/zslayton/cron) library.

The scheduling format is as follows:

```text
sec   min   hour   day of month   month   day of week   year
*     *     *      *              *       *             *
```

Time is specified for `UTC` and not your local timezone. Note that the year may
be omitted.

Comma separated values such as `5,8,10` represent more than one time value. So
for example, a schedule of `0 2,14,26 * * * *` would execute on the 2nd, 14th,
and 26th minute of every hour.

Ranges can be specified with a dash. A schedule of `0 0 * 5-10 * *` would
execute once per hour but only on day 5 through 10 of the month.

Day of the week can be specified as an abbreviation or the full name. A
schedule of `0 0 6 * * Sun,Sat` would execute at 6am on Sunday and Saturday.

A simple example is provided in the examples directory.

```

