import fs from "fs";
import path from "path";
import util from "util";
import { FastifyInstance, FastifyRequest, FastifyReply } from "fastify";

const readFile = util.promisify(fs.readFile);

export async function androidAppLinkController(fastify: FastifyInstance) {
  fastify.get(
    "/.well-known/assetlinks.json",
    async function (_request: FastifyRequest, reply: FastifyReply) {
      const data = await readFile(
        path.join(__dirname, "../../.well-known/assetlinks.json")
      );
      reply.header("Content-Type", "application/json");
      reply.send(data);
    }
  );
}

export async function iosAppLinkController(fastify: FastifyInstance) {
  [
    "/apple-app-site-association",
    "/.well-known/apple-app-site-association",
  ].forEach((urlPath) =>
    fastify.get(
      urlPath,
      async function (_request: FastifyRequest, reply: FastifyReply) {
        const data = await readFile(
          path.join(
            __dirname,
            "../../.well-known/apple-app-site-association.json"
          )
        );
        reply.header("Content-Type", "application/json");
        reply.send(data);
      }
    )
  );
}
