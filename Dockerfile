FROM public.ecr.aws/amazoncorretto/amazoncorretto:17
#FROM 532607548077.dkr.ecr.us-east-1.amazonaws.com/mynodeapp-backend-dev:latest

WORKDIR /app

# Install Maven (Corretto uses yum, not apt)
RUN yum install -y maven && yum clean all

# Copy project files

COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Rename JAR dynamically (no hardcoding)
RUN cp target/*.jar app.jar

# Run application
CMD ["java", "-jar", "app.jar"]
