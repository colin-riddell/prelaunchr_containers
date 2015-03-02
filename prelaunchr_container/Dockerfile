# Use phusion/passenger-full as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/passenger-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/passenger-ruby21:0.9.15

# Set correct environment variables.
ENV HOME /prelaunchr/


# If you're using the 'customizable' variant, you need to explicitly opt-in
# for features. Uncomment the features you want:
#
#   Build system and git.
#RUN /pd_build/utilities.sh
#   Ruby support.
#RUN /pd_build/ruby1.9.sh
#RUN /pd_build/ruby2.0.sh
RUN ruby-switch --set ruby2.1
#RUN /pd_build/ruby2.2.sh
#RUN /pd_build/jruby1.7.sh
#   Python support.
#   Node.js and Meteor support.
#RUN /pd_build/nodejs.sh

# ...put your own build instructions here...
RUN git clone https://github.com/harrystech/prelaunchr.git
RUN cd /prelaunchr/ &&  bundle install --system

# Add the database config file, then replace host IP details of linked container.
ADD database.yml /prelaunchr/config/database.yml
ADD start.sh /
EXPOSE 3000

CMD chmod +x start.sh && ./start.sh



# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


#  run container with: $ sudo docker run --rm -P --name pg_test eg_postgresql
