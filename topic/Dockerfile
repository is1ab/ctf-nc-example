FROM ubuntu:24.04
# 自行設定 image

RUN apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y xinetd dos2unix lib32z1 

# RUN apt-get install -y python3
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

RUN dos2unix /start.sh
RUN dos2unix /etc/xinetd.d/ctf
RUN dos2unix /home/ctf/run.sh

# 自行加上需要的指令

CMD ["/start.sh"]

EXPOSE 80
