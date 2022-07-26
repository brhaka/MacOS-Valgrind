FROM ubuntu:latest

RUN apt-get update && apt-get install build-essential libreadline-dev vim clang valgrind git gdb -y

WORKDIR /valgrind

RUN echo 'alias valgrind-flags="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $@"\necho -e "\e[36mCustom valgrind alias: \e[32mvalgrind-flags\e[0m"' >> ~/.bashrc
