FROM python:3.12.5-slim-bookworm 
# 自行設定 image

RUN apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y lib32z1 xinetd 

RUN apt-get install -y python3
# 若有需要可自行新增需要套件


RUN useradd -m ctf

WORKDIR /home/ctf

COPY ./ctf.xinetd /etc/xinetd.d/ctf
COPY ./start.sh /start.sh
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

RUN chmod +x /start.sh

COPY ./bin/ /home/ctf/
RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf 

CMD ["/start.sh"]

EXPOSE 80