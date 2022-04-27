FROM ubuntu:latest

RUN apt-get update && apt-get install vim make clang gcc valgrind git -y

WORKDIR /valgrind

RUN echo 'alias valgrind-flags="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $@"\necho -e "\e[36mCustom valgrind alias: \e[32mvalgrind-flags\e[0m"' >> ~/.bashrc
