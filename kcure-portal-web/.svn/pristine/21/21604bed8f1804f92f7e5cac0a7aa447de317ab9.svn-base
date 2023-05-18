function ElasticRequest({ url, path }) {
  async function getResult(query, size) {
    const headers = new Headers();
    headers.append("Content-Type", "application/json");

    const body = JSON.stringify({
      path,
      query,
      size,
    });

    const requestOptions = {
      method: "POST",
      headers,
      body,
      redirect: "follow",
    };

	// console.log("Debug>>> (elastic url) " + url);
	// alert(url);

    const response = await fetch(url, requestOptions);
    const result = await response.json();
    if (typeof result === "string") {
    	return JSON.parse(result);
    } else {
    	return result;
    }
  }

  function getRows(result) {
    return result.hits.hits.map((hit) => hit._source);
  }

  async function search(query, size = 10) {
    const result = await getResult(query, size);
    const rows = getRows(result);
    return rows;
  }

  return { search };
}
