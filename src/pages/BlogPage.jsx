import BlogPost from '../components/BlogPost'
import Footer from '../components/Footer'
import { useJson } from '../utils/useJson'

export default function BlogPage() {
  const { data: profile, loading } = useJson('profile')

  return (
    <>
      <header className="navbar blog-page-header">
        <nav className="container nav-inner">
          <a className="nav-logo" href="#/">
            <span className="nav-logo-brace">{'<'}</span>
            {loading ? 'Notes' : profile.name}
            <span className="nav-logo-brace">{'/>'}</span>
          </a>
          <a className="btn btn-ghost blog-back" href="#/">
            ← Back to Home
          </a>
        </nav>
      </header>
      <main>
        <BlogPost />
      </main>
      <Footer />
    </>
  )
}
