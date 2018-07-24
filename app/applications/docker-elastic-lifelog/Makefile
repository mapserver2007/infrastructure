.DEFAULT: all

all: build run

build:
	sudo docker build -t elastic-lifelog .

run:
	sudo docker run --rm -v /workspace/docker-elk/data:/workspace/elastic-lifelog/fitbit/data elastic-lifelog \
		ruby /workspace/elastic-lifelog/fitbit/fitbit.rb && \
	sudo docker run --rm -v /workspace/docker-elk/data:/workspace/elastic-lifelog/runkeeper/data elastic-lifelog \
		ruby /workspace/elastic-lifelog/runkeeper/runkeeper.rb && \
	sudo docker run --rm -v /workspace/docker-elk/data:/workspace/elastic-lifelog/lastfm/data elastic-lifelog \
		ruby /workspace/elastic-lifelog/lastfm/lastfm.rb && \
	sudo docker run --rm -v /workspace/docker-elk/data:/workspace/elastic-lifelog/withings/data elastic-lifelog \
		ruby /workspace/elastic-lifelog/withings/withings.rb
