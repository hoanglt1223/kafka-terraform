const kafka = require("kafka-node");

const client = new kafka.KafkaClient({
  kafkaHost: "157.230.36.232:9092",
  connectTimeout: 10000,
  requestTimeout: 10000,
});
const producer = new kafka.Producer(client);

const km = new kafka.KeyedMessage("key", "message");
const payloads = [
  { topic: "topic1", messages: "hi", partition: 0 },
  { topic: "topic2", messages: ["hello", "world", km] },
];
producer.on("ready", function () {
  producer.send(payloads, function (err, data) {
    console.log("🚀 ~ file: producer.js:40 ~ data:", data);
    console.log("🚀 ~ file: producer.js:40 ~ err:", err);
  });
});

producer.on("error", function (err) {
  console.log("🚀 ~ file: producer.js:48 ~ err:", err);
});
