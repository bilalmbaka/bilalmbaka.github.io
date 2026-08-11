import { useEffect, useState } from "react";
import { marked } from "marked";

marked.setOptions({
  gfm: true,
  breaks: true,
});

// Fetches a single .md file from the public/ directory and converts it to HTML.
export function fetchMarkdown(path) {
  return fetch(path)
    .then((res) => {
      if (!res.ok) throw new Error(`Failed to load ${path} (${res.status})`);
      return res.text();
    })
    .then((md) => marked.parse(md));
}

// React hook that loads a .md file and returns { html, loading, error }.
export function useMarkdown(path) {
  const [state, setState] = useState({
    html: null,
    loading: true,
    error: null,
  });

  useEffect(() => {
    let active = true;
    setState({ html: null, loading: true, error: null });
    fetchMarkdown(path)
      .then((html) => {
        if (active) setState({ html, loading: false, error: null });
      })
      .catch((error) => {
        if (active) setState({ html: null, loading: false, error });
      });
    return () => {
      active = false;
    };
  }, [path]);

  return state;
}

// Extracts a display name from a note path (e.g. ".../widget-testing.md" -> "widget-testing").
export function noteName(path) {
  return path.split("/").pop().replace(/\.md$/i, "");
}
