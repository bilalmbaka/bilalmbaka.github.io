import Navbar from './components/Navbar'
import Hero from './components/Hero'
import Experience from './components/Experience'
import Education from './components/Education'
import Skills from './components/Skills'
import Projects from './components/Projects'
import Learning from './components/Learning'
import Links from './components/Links'
import Footer from './components/Footer'

function App() {
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

export default App
