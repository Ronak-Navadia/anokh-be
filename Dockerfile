# Step 1: Use Node.js version 24.9 as the base image
FROM node:24.9

# Step 2: Set the working directory inside the container
WORKDIR /usr/src/app

# Step 3: Copy dependency files first for efficient caching
COPY package.json yarn.lock ./

# Step 4: Install dependencies using Yarn
RUN yarn install

# Step 5: Copy the entire project into the container
COPY . .

# Step 6: Expose the port your NestJS app runs on
EXPOSE 7071

# Step 7: Start the application in development mode
CMD ["yarn", "run", "start:dev"]
