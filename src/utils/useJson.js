import { useEffect, useState } from "react";

// Fetches a single JSON file from the public /data/ directory.
export function fetchData(name) {
  return fetch(`/data/${name}.json`).then((res) => {
    if (!res.ok)
      throw new Error(`Failed to load /data/${name}.json (${res.status})`);
    return res.json();
  });
}

// React hook that loads a JSON file from the public /data/ directory.
// Returns { data, loading, error }.
export function useJson(name) {
  const [state, setState] = useState({
    data: null,
    loading: true,
    error: null,
  });

  useEffect(() => {
    let active = true;
    setState({ data: null, loading: true, error: null });
    fetchData(name)
      .then((data) => {
        if (active) setState({ data, loading: false, error: null });
      })
      .catch((error) => {
        if (active) setState({ data: null, loading: false, error });
      });
    return () => {
      active = false;
    };
  }, [name]);

  return state;
}
