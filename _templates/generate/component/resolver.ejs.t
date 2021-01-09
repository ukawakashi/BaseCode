---
to: src/graphql/modules/<%= h.inflection.camelize(name, true) %>/<%= h.inflection.camelize(name, true) %>.resolver.ts
---
import { ROLES } from "../../../constants/role.const";
import { AuthHelper } from "../../../helpers";
import { Context } from "../../context";
import { <%= h.inflection.camelize(name, true) %>Service } from "./<%= h.inflection.camelize(name, true) %>.service";

const Query = {
  getAll<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN, ROLES.EDITOR]);
    return <%= h.inflection.camelize(name, true) %>Service.fetch(args.q);
  },
  getOne<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN, ROLES.EDITOR]);
    const { id } = args;
    return await <%= h.inflection.camelize(name, true) %>Service.findOne({ _id: id });
  },
};

const Mutation = {
  create<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN]);
    const { data } = args;
    return await <%= h.inflection.camelize(name, true) %>Service.create(data);
  },
  update<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN]);
    const { id, data } = args;
    return await <%= h.inflection.camelize(name, true) %>Service.updateOne(id, data);
  },
  deleteOne<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN]);
    const { id } = args;
    return await <%= h.inflection.camelize(name, true) %>Service.deleteOne(id);
  },
  deleteMany<%= h.inflection.camelize(name) %>: async (root: any, args: any, context: Context) => {
    AuthHelper.acceptRoles(context, [ROLES.ADMIN]);
    const { ids } = args;
    let result = await <%= h.inflection.camelize(name, true) %>Service.deleteMany(ids);
    return result;
  },
};

const <%= h.inflection.camelize(name) %> = {
  
};

export default {
  Query,
  Mutation,
  <%= h.inflection.camelize(name) %>,
};
