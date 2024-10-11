<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>8-bit CPU Design Feedback Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h2>8-bit CPU Design Feedback Form</h2>
    <form action="submit_feedback.php" method="POST">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="interest">Which Component Are You Most Interested In?</label>
        <select id="interest" name="interest">
            <option value="ALU">ALU (Arithmetic Logic Unit)</option>
            <option value="Control Unit">Control Unit</option>
            <option value="Data Path">Data Path</option>
            <option value="CPU">CPU (Top-Level Design)</option>
        </select>

        <label for="feedback">Project Feedback or Suggestions:</label>
        <textarea id="feedback" name="feedback" rows="4" placeholder="Share your thoughts, suggestions, or ask any questions related to the 8-bit CPU project."></textarea>

        <label for="collaboration">Would You Be Interested in Contributing to the Project?</label>
        <input type="radio" id="yes" name="collaboration" value="yes"> Yes
        <input type="radio" id="no" name="collaboration" value="no"> No

        <button type="submit">Submit Feedback</button>
    </form>

</body>
</html>
