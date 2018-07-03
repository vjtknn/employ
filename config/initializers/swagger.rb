GrapeSwaggerRails.options.url = "/api/docs"
GrapeSwaggerRails.options.app_name = "Employ"
GrapeSwaggerRails.options.before_action do
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
end
GrapeSwaggerRails.options.doc_expansion = "list"
