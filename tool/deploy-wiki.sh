scp $1 myblog:/home/zj/mywiki/content/$2
ansible webservers -m raw -a 'cd ~/mywiki;simiki generate;touch zj' -u zj
ansible webservers -m raw -a 'sudo start wiki' -u zj

---
hosts: webservers

vars:
    - http_port: 80
      max_clients: 200

remote_user: root

tasks:
    - name: ensure apache is at the latest version
      yum: pkg=httpd state=latest

    - name: write the apache config file
      template: src=/srv/httpd.j2 dest=/etc/httpd.conf
      notify:
      - restart apache

    - name: ensure apache is running
      service: name=httpd state=started

handlers:
    - name: restart apache
      service: name=httpd state=restarted
