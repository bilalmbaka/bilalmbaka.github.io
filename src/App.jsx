import { useEffect, useState } from 'react'
import Navbar from './components/Navbar'
import Hero from './components/Hero'
import Experience from './components/Experience'
import Education from './components/Education'
import Skills from './components/Skills'
import Projects from './components/Projects'
import Learning from './components/Learning'
import Links from './components/Links'
import Footer from './components/Footer'
import BlogPage from './pages/BlogPage'

// Minimal hash router: "#/blog" shows the notes page, anything else shows the portfolio.
function useHashRoute() {
  const [hash, setHash] = useState(window.location.hash)
  useEffect(() => {
    const onChange = () => setHash(window.location.hash)
    window.addEventListener('hashchange', onChange)
    return () => window.removeEventListener('hashchange', onChange)
  }, [])
  return hash
}

function Portfolio() {
  return (
    <>
      <Navbar />
      <main>
        <Hero />
        <Experience />
        <Education />
        <Skills />
        <Projects />
        <Learning />
        <Links />
      </main>
      <Footer />
    </>
  )
}

export default function App() {
  const hash = useHashRoute()
  if (hash.startsWith('#/blog')) return <BlogPage />
  return <Portfolio />
}
