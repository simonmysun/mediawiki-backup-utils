# MediaWiki-Backup-Utils

A Docker-based utility for automated backups of MediaWiki installations, including database and images.

## Features

- Automated periodic backups (daily, weekly, monthly) with retention
- Database backup using mysqldump
- Image directory backup
- Compressed backup files
- Sleep random time before backup to avoid backup at the same time
- Docker-based solution

## Prerequisites

- Docker
- Running MediaWiki installation
- MariaDB/MySQL database
- Sufficient storage space for backups

## Usage 

With docker compose:

```yaml
name: backup

services:
  backup:
    build: https://github.com/simonmysun/mediawiki-backup-utils.git
    environment:
      MYSQL_CONTAINER_NAME: DB_CONTAINER_NAME
      MYSQL_ROOT_PASSWORD: <REDACATED>
    user: root
    init: true
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /path/to/images/:/var/www/html/images/:ro
      - /path/to/backup/:/backup/:rw
    restart: always
```

With docker run: try [decomposerize](https://www.decomposerize.com/)

## Configuration

Please make sure the container has access to the database container. Refer to the [Docker networking documentation](https://docs.docker.com/compose/networking/) for more information.

### Environment Variables

- `MYSQL_CONTAINER_NAME`: Name of your MediaWiki database container. It is actually the hostname of the database container with help of docker. IP address can be used as well.
- `MYSQL_ROOT_PASSWORD`: Root password for the database.

### Volume Mounts

- `/etc/localtime`: System time synchronization
- `/var/www/html/images/`: MediaWiki images directory (can be read-only)
- `/backup/`: Backup destination directory (must be read-write)

### Retention Policy

- Daily backups: 3 days
- Weekly backups: ~4 weeks
- Monthly backups: ~3 months

If you want to change this, you can mount your own modified backup scripts to `/etc/periodic/*` and adjust the retention policy.

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
