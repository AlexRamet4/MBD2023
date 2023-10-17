FROM amazoncorretto:21 as build

WORKDIR /java-test/

COPY volumen/Main.java /java-test/

RUN ["javac", "Main.java"]

FROM amazoncorretto:21 as execute

WORKDIR /java-test/

COPY --from=build /java-test/Main.class /java-test/Main.class

ENTRYPOINT [ "java", "Main" ]