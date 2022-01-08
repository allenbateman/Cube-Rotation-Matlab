#pragma once
//--------GET THE MATRIX---------
//From euler Axis and Angle to Matrix
void GetMatrixFromAxisAngle(float* axis, float angle, float matrix[][3])
{
	float axisNorm;
	float matrixIdentity[3][3] = { 0 };
	float matrixUU[3][3] = { 0 };
	float matrixVectorProduct[3][3] = { 0 };



	for (int i = 0; i < 3; i++)
	{
		matrixIdentity[i][i] = cos(angle);
	}
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			matrixUU[i][j] = (1 - cos(angle)) * (axis[i] * axis[j]);
		}
	}
	matrixVectorProduct[1][0] = axis[2] * sin(angle);
	matrixVectorProduct[2][0] = -axis[1] * sin(angle);
	matrixVectorProduct[0][1] = -axis[2] * sin(angle);
	matrixVectorProduct[2][1] = axis[0] * sin(angle);
	matrixVectorProduct[0][2] = axis[1] * sin(angle);
	matrixVectorProduct[1][2] = -axis[0] * sin(angle);
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			matrix[i][j] = matrixIdentity[i][j] + matrixUU[i][j] + matrixVectorProduct[i][j];
		}
	}
}

//From Euler Angles to Matrix
void GetMatrixFromEulerAngles(float alpha, float beta, float gamma, float matrix[][3])
{
	matrix[0][0] = cos(gamma) * cos(beta);
	matrix[0][1] = cos(gamma) * sin(beta) * sin(alpha) - sin(gamma) * cos(alpha);
	matrix[0][2] = cos(gamma) * sin(beta) * cos(alpha) + sin(gamma) * sin(alpha);

	matrix[1][0] = sin(gamma) * cos(beta);
	matrix[1][1] = sin(gamma) * sin(beta) * sin(alpha) + cos(gamma) * cos(alpha);
	matrix[1][2] = sin(gamma) * sin(beta) * cos(alpha) - cos(gamma) * sin(alpha);

	matrix[2][0] = -sin(beta);
	matrix[2][1] = cos(beta) * sin(alpha);
	matrix[2][2] = cos(beta) * cos(alpha);
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			if (matrix[i][j] > -0.01f && matrix[i][j] < 0.01f) matrix[i][j] = 0.0f;
		}
	}
}

//From Quaternion to Euler Axis and Angle, then from Axis and angle to Matrix
void GetAxisAngleFromQuaternion(float* quaternion, float* axis, float& angle)
{

	angle = 2 * acos(quaternion[0]);
	while (angle * RADTODEG > 360) angle -= 360 * DEGTORAD;
	for (int i = 0; i < 3; i++)
	{
		axis[i] = quaternion[i + 1] / sqrt(1 - pow(quaternion[0], 2));
	}

}

//From Rotation Vector to Euler Axis and Angle, then from Axis and Angle to Matrix
void GetAxisAngleFromVector(float* vector, float* axis, float& angle)
{
	angle = sqrt(pow(vector[0], 2) + pow(vector[1], 2) + pow(vector[2], 2));
	while (angle * RADTODEG > 360) angle -= 360 * DEGTORAD;
	for (int i = 0; i < 3; i++)
	{
		axis[i] = vector[i] / angle;
	}
}


//---------GET THE COMPONENTS FROM THE MATRIX---------
//From Matrix to Euler Angles
void GetEulerAnglesFromMatrix(float matrix[][3], float& alpha, float& beta, float& gamma)
{
	beta = RADTODEG * (-asin(matrix[2][0]));
	gamma = RADTODEG * atan2f(matrix[0][0] / cos(beta), matrix[1][0] / cos(beta));
	alpha = RADTODEG * atan2f(matrix[2][1] / cos(beta), matrix[2][2] / cos(beta));
	if (alpha < 0) alpha = alpha + 180;
	if (gamma < 0) gamma = gamma + 180;
}
//From Matrix to Euler Axis and Angle 
void GetAxisAngleFromMatrix(float matrix[][3], float* axis, float& angle)
{
	float transposed[3][3] = { 0 };
	float matrixVectorProduct[3][3] = { 0 };

	angle = acos((GetTrace(matrix) - 1) / 2);
	while (angle * RADTODEG > 360) angle -= 360 * DEGTORAD;

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			transposed[i][j] = matrix[j][i];
		}
	}
	for (int i = 0; i < 3; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			matrixVectorProduct[i][j] = (matrix[i][j] - transposed[i][j]) / (2 * sin(angle));
		}
	}
	axis[0] = (matrixVectorProduct[2][1] - matrixVectorProduct[1][2]) / 2;
	axis[1] = (matrixVectorProduct[0][2] - matrixVectorProduct[2][0]) / 2;
	axis[2] = (matrixVectorProduct[1][0] - matrixVectorProduct[0][1]) / 2;
}

//From Matrix to Euler Axis and Angle, then from Euler Axis and Angle to Quaternion
void GetQuaternionFromAxisAngle(float* axis, float angle, float* quaternion)
{
	quaternion[0] = cos(angle / 2);
	for (int i = 0; i < 3; i++)
	{
		quaternion[i + 1] = axis[i] * sin(angle / 2);
	}
}
//From Matrix to Euler Axis and Angle, then from Euler Axis and Angle to Rotation Vector
void GetVectorFromAxisAngle(float* axis, float angle, float* vector)
{
	for (int i = 0; i < 3; i++)
	{
		vector[i] = angle * axis[i];
	}
}