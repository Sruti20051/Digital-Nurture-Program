import "./App.css";

import BookDetails from "./Components/BookDetails";
import BlogDetails from "./Components/BlogDetails";
import CourseDetails from "./Components/CourseDetails";

import { books, blogs, courses } from "./Components/Data";

function App() {

  const showBooks = true;
  const showBlogs = true;
  const showCourses = true;

  return (

    <div>

      <h1 style={{ textAlign: "center" }}>Blogger App</h1>

      <div className="container">

        {showCourses && (
          <CourseDetails courses={courses} />
        )}

        {showBooks ? (
          <BookDetails books={books} />
        ) : null}

        {showBlogs ? (
          <BlogDetails blogs={blogs} />
        ) : null}

      </div>

    </div>

  );

}

export default App;
