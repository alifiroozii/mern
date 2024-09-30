const express = require("express");
const { graphqlHTTP } = require("express-graphql");
const connectDB = require("./server/config/db");
const mainSchema = require("./schema/mainSchema");
const app = express();
connectDB();
const PORT = process.env.PORT || 5000;
app.use(
  "/graphql",
  graphqlHTTP({
    schema:mainSchema,
    graphiql: true,
  })
);
app.use(express.json());

// راه‌اندازی سرور
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
